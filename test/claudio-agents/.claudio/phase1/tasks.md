# Phase 1: Foundation and Configuration - Task Breakdown

## Phase Overview
**Status**: Mostly Complete - Needs Asset Setup and Testing  
**Duration**: 2 days remaining (foundation largely implemented)  
**Resources**: 1 developer  

## Phase Objectives
- Complete asset pipeline setup for dark mode
- Create Tailwind configuration file
- Set up CSS custom properties for theming
- Finalize JavaScript theme management utilities
- Complete testing of theme persistence

## Current Status Assessment
The project already has significant dark mode functionality implemented:
- ✅ Theme toggle functionality in TaskLive.Index
- ✅ Dark mode classes throughout the UI
- ✅ LocalStorage persistence via JavaScript in root.html.heex
- ✅ System preference detection
- ❌ Missing: Asset pipeline setup (assets/ directory is empty)
- ❌ Missing: Tailwind configuration file
- ❌ Missing: Organized CSS theme structure

## Tasks

### Task 1.1: Asset Pipeline Setup
**Priority**: Critical  
**Estimate**: 4 hours  
**Dependencies**: None  
**Assignee**: Frontend Developer

**Objective**: Set up the complete asset pipeline with Tailwind CSS and theme management

**Requirements**:
- Create `assets/` directory structure
- Set up `package.json` with required dependencies
- Configure asset compilation pipeline
- Create basic CSS and JavaScript files

**Deliverables**:
- `assets/package.json` with Tailwind CSS and build tools
- `assets/css/app.css` as main stylesheet
- `assets/js/app.js` as main JavaScript entry point
- Working asset compilation via `mix assets.deploy`

**Implementation Steps**:
1. Create `assets/package.json` with dependencies:
   ```json
   {
     "devDependencies": {
       "tailwindcss": "^3.4.0",
       "@tailwindcss/forms": "^0.5.0",
       "autoprefixer": "^10.4.0",
       "postcss": "^8.4.0"
     }
   }
   ```
2. Create `assets/css/app.css` importing Tailwind
3. Create `assets/js/app.js` with Phoenix LiveView setup
4. Test asset compilation

**Acceptance Criteria**:
- [ ] Asset pipeline compiles without errors
- [ ] Tailwind CSS classes work in the application
- [ ] Dark mode classes function properly
- [ ] No console errors in browser

**Files to Create**:
- `/assets/package.json`
- `/assets/css/app.css`
- `/assets/js/app.js`
- `/assets/tailwind.config.js`

### Task 1.2: Tailwind Configuration and Theme Setup
**Priority**: Critical  
**Estimate**: 3 hours  
**Dependencies**: Task 1.1  
**Assignee**: Frontend Developer

**Objective**: Configure Tailwind CSS for optimal dark mode support and create theme structure

**Requirements**:
- Create comprehensive Tailwind configuration
- Set up dark mode with class-based strategy
- Define custom CSS properties for theme consistency
- Create theme utility classes

**Deliverables**:
- `assets/tailwind.config.js` with dark mode configuration
- `assets/css/themes.css` with custom properties
- Extended color palette for both themes
- Theme transition utilities

**Implementation Steps**:
1. Create `tailwind.config.js` with:
   - `darkMode: 'class'` configuration
   - Custom color scheme matching existing UI
   - Extended utilities for theme transitions
2. Create `assets/css/themes.css` with CSS custom properties
3. Update `assets/css/app.css` to import theme styles
4. Test theme switching performance

**Acceptance Criteria**:
- [ ] Dark mode classes work across all components
- [ ] Smooth transitions between themes
- [ ] Custom properties provide consistent theming
- [ ] No CSS conflicts or overrides

**Files to Create**:
- `/assets/tailwind.config.js`
- `/assets/css/themes.css`

**Files to Modify**:
- `/assets/css/app.css`

### Task 1.3: JavaScript Theme Manager Enhancement
**Priority**: Medium  
**Estimate**: 2 hours  
**Dependencies**: Task 1.1, 1.2  
**Assignee**: Frontend Developer

**Objective**: Extract and enhance theme management JavaScript into dedicated module

**Requirements**:
- Create dedicated theme manager module
- Enhance cross-tab synchronization
- Add theme transition effects
- Improve error handling

**Current Implementation**: Theme JavaScript is inline in `root.html.heex` - needs to be extracted and enhanced.

**Deliverables**:
- `assets/js/theme-manager.js` with enhanced functionality
- Better theme persistence logic
- Cross-tab theme synchronization
- Theme change animations

**Implementation Steps**:
1. Extract theme JavaScript from `root.html.heex` 
2. Create `assets/js/theme-manager.js` with:
   - Theme detection and persistence
   - Cross-tab synchronization using storage events
   - Animation controls
   - Error recovery for localStorage failures
3. Update `root.html.heex` to use new theme manager
4. Test across multiple browser tabs

**Acceptance Criteria**:
- [ ] Theme changes sync across browser tabs
- [ ] Smooth animation during theme transitions
- [ ] Graceful handling of localStorage errors
- [ ] No JavaScript errors in console

**Files to Create**:
- `/assets/js/theme-manager.js`

**Files to Modify**:
- `/assets/js/app.js`
- `/lib/task_app_web/components/layouts/root.html.heex`

### Task 1.4: Integration Testing and Validation
**Priority**: High  
**Estimate**: 3 hours  
**Dependencies**: Tasks 1.1, 1.2, 1.3  
**Assignee**: Frontend Developer

**Objective**: Comprehensive testing of foundation components

**Requirements**:
- Test asset compilation and loading
- Validate theme persistence across sessions
- Test system preference detection
- Browser compatibility testing

**Deliverables**:
- Verified asset pipeline functionality
- Validated theme persistence behavior
- Browser compatibility report
- Performance baseline measurements

**Implementation Steps**:
1. Test asset compilation in development and production modes
2. Test theme persistence across:
   - Page reloads
   - Browser restarts
   - Different tabs
3. Test system preference detection on different OS
4. Measure theme switching performance

**Acceptance Criteria**:
- [ ] Assets compile successfully in dev and prod
- [ ] Theme persists across browser sessions
- [ ] System preferences detected correctly
- [ ] Theme switching < 100ms
- [ ] No memory leaks from theme system

**Testing Checklist**:
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Edge (latest)
- [ ] Mobile Safari (iOS)
- [ ] Chrome Mobile (Android)

## Phase Success Criteria
- [ ] Complete asset pipeline with Tailwind CSS
- [ ] Functional theme switching with persistence
- [ ] Cross-browser theme compatibility
- [ ] Performance benchmarks established

## Files Currently with Dark Mode Support
- `/lib/task_app_web/live/task_live/index.ex` - Complete dark mode implementation
- `/lib/task_app_web/components/layouts/root.html.heex` - Theme switching JavaScript
- `/lib/task_app_web/components/layouts/app.html.heex` - Needs dark mode updates

## Next Phase Preparation
Upon completion, Phase 1 will provide:
- Complete asset foundation for Phase 2 UI development
- Reliable theme management system
- Performance baseline for optimization
- Testing framework for subsequent phases

## Risk Mitigation
- **Asset Pipeline Issues**: Test with minimal configuration first, build incrementally
- **Theme Persistence Failures**: Implement comprehensive localStorage error handling
- **Performance Problems**: Profile theme switching, optimize CSS selectors
- **Browser Compatibility**: Test core browsers early, implement progressive enhancement