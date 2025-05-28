//
//  AvatarView.swift
//  AvatarDemo
//
//  Created by Sakir Saiyed on 27/05/25.
//

import SwiftUI

import SwiftUI

struct AvatarStyleConfiguration {
  let title: String
  let subTitle: String
  let detailsTitle: String
  let imageName: String
}

struct ResolvedAvatarStyle<Style: AvatarStyle>: View {
  var configuration: Style.Configuration
  var style: Style

  var body: Style.Body {
    style.makeBody(configuration: configuration)
  }
}

extension AvatarStyle {
  func resolve(configuration: Configuration) -> some View {
    ResolvedAvatarStyle(configuration: configuration, style: self)
  }
}

protocol AvatarStyle: DynamicProperty {
  associatedtype Body: View

  @ViewBuilder
  func makeBody(configuration: Configuration) -> Body

  typealias Configuration = AvatarStyleConfiguration
}

struct AvatarStyleKey: EnvironmentKey {
  static var defaultValue: any AvatarStyle = DefaultAvatarStyle()
}

extension EnvironmentValues {
  var avatarStyle: any AvatarStyle {
    get { self[AvatarStyleKey.self] }
    set { self[AvatarStyleKey.self] = newValue }
  }
}

extension View {
  func avatarStyle(_ style: some AvatarStyle) -> some View {
    environment(\.avatarStyle, style)
  }
}

struct DefaultAvatarStyle: AvatarStyle {
  @Environment(\.avatarImageShape) var imageShape
  @Environment(\.editProfileHandler) var editProfileHandler

  @ViewBuilder
  private func profileImage(_ configuration: Configuration) -> some View {
    if imageShape == .round {
      Image(configuration.imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 75, height: 75, alignment: .center)
        .clipShape(.circle)
        .accessibilityLabel(configuration.title)
    }
    else {
      Image(configuration.imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 75, height: 75, alignment: .center)
        .accessibilityLabel(configuration.title)
    }
  }

  private func titleLabel(_ text: String) -> some View {
    Text(text)
      .font(.headline)
  }

  private func detailsLabel(_ text: String) -> some View {
    Text(text)
      .font(.subheadline)
  }

  func makeBody(configuration: Configuration) -> some View {
    HStack(alignment: .top) {
      profileImage(configuration)
        .onTapGesture {
          if let editProfileHandler {
            editProfileHandler()
          }
        }
      VStack(alignment: .leading) {
        titleLabel(configuration.title)
        detailsLabel(configuration.subTitle)
        detailsLabel(configuration.detailsTitle)
      }
      Spacer()
    }
    .accessibilityElement(children: .contain)
    .accessibilityLabel(configuration.title)
  }
}

struct AvatarEditProfileHandler: EnvironmentKey {
  static var defaultValue: (() -> Void)?
}

extension EnvironmentValues {
  var editProfileHandler: (() -> Void)? {
    get { self[AvatarEditProfileHandler.self] }
    set { self[AvatarEditProfileHandler.self] = newValue }
  }
}

extension View {
  public func onEditProfile(editProfileHandler: @escaping () -> Void) -> some View {
    environment(\.editProfileHandler, editProfileHandler)
  }
}

enum AvatarImageShape {
  case round
  case rectangle
}

struct AvatarImageShapeKey: EnvironmentKey {
  static var defaultValue: AvatarImageShape = .round
}

extension EnvironmentValues {
  var avatarImageShape: AvatarImageShape {
    get { self[AvatarImageShapeKey.self] }
    set { self[AvatarImageShapeKey.self] = newValue }
  }
}

extension View {
  func avatarImageShape(_ imageShape: AvatarImageShape) -> some View {
    environment(\.avatarImageShape, imageShape)
  }
}

struct AvatarView: View {
  @Environment(\.avatarStyle) var style

  var title: String
  var subTitle: String
  var detailsTitle: String
  var imageName: String

  init(_ title: String, subTitle: String, detailsTitle: String, image name: String) {
    self.title = title
    self.subTitle = subTitle
    self.detailsTitle = detailsTitle
    self.imageName = name
  }

  var body: some View {
    let configuration = AvatarStyleConfiguration(
      title: title,
      subTitle: subTitle,
      detailsTitle: detailsTitle,
      imageName: imageName)

    AnyView(style.resolve(configuration: configuration))
  }
}

#Preview {
  VStack {
    let person = Person.sample
    AvatarView(person.fullName, subTitle: person.jobTitle, detailsTitle: person.affiliation, image: person.profileImageName)
      .avatarImageShape(.rectangle)
      .onEditProfile {
        print("You've tapped on the profile image!")
      }
      .padding()
    AvatarView(person.fullName, subTitle: person.jobTitle, detailsTitle: person.affiliation, image: person.profileImageName)
      .padding()
  }
}
